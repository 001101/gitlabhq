/* eslint-disable no-new */
import Flash from './flash';
import DropLab from './droplab/drop_lab';
import ISetter from './droplab/plugins/input_setter';
import { __, sprintf } from './locale';

// Todo: Remove this when fixing issue in input_setter plugin
const InputSetter = Object.assign({}, ISetter);

const CREATE_MERGE_REQUEST = 'create-mr';
const CREATE_BRANCH = 'create-branch';

export default class CreateMergeRequestDropdown {
  constructor(wrapperEl) {
    this.wrapperEl = wrapperEl;
    this.availableButton = this.wrapperEl.querySelector('.available');
    this.branchInput = this.wrapperEl.querySelector('.js-branch-name');
    this.branchMessage = this.wrapperEl.querySelector('.js-branch-message');
    this.createMergeRequestButton = this.wrapperEl.querySelector('.js-create-merge-request');
    this.createTargetButton = this.wrapperEl.querySelector('.js-create-target');
    this.dropdownList = this.wrapperEl.querySelector('.dropdown-menu');
    this.dropdownToggle = this.wrapperEl.querySelector('.js-dropdown-toggle');
    this.refInput = this.wrapperEl.querySelector('.js-ref');
    this.refMessage = this.wrapperEl.querySelector('.js-ref-message');
    this.unavailableButton = this.wrapperEl.querySelector('.unavailable');
    this.unavailableButtonArrow = this.unavailableButton.querySelector('.fa');
    this.unavailableButtonText = this.unavailableButton.querySelector('.text');

    this.branchCreated = false;
    this.branchTaken = true;
    this.canCreatePath = this.wrapperEl.dataset.canCreatePath;
    this.createBranchPath = this.wrapperEl.dataset.createBranchPath;
    this.createMrPath = this.wrapperEl.dataset.createMrPath;
    this.droplabInitialized = false;
    this.isCreatingBranch = false;
    this.isCreatingMergeRequest = false;
    this.isGettingRef = false;
    this.inputsAreValid = true;
    this.mergeRequestCreated = false;
    this.refDebounce = _.debounce((value, target) => this.getRef(value, target), 500);
    this.refsPath = this.wrapperEl.dataset.refsPath;

    // These regexps are used to replace
    // a backend generated new branch name and its source (ref)
    // with user's inputs.
    this.regexps = {
      branch: {
        createBranchPath: new RegExp('(branch_name=)(.+?)(?=&issue)'),
        createMrPath: new RegExp('(branch_name=)(.+?)(?=&ref)'),
      },
      ref: {
        createBranchPath: new RegExp('(ref=)(.+?)$'),
        createMrPath: new RegExp('(ref=)(.+?)$'),
      },
    };

    this.init();
  }

  available() {
    this.availableButton.classList.remove('hide');
    this.unavailableButton.classList.add('hide');
  }

  bindEvents() {
    this.createMergeRequestButton.addEventListener('click', this.onClickCreateMergeRequestButton.bind(this));
    this.createTargetButton.addEventListener('click', this.onClickCreateMergeRequestButton.bind(this));
    this.dropdownToggle.addEventListener('click', this.onClickSetFocusOnBranchNameInput.bind(this));
    this.branchInput.addEventListener('keyup', this.onChangeInput.bind(this));
    this.refInput.addEventListener('keyup', this.onChangeInput.bind(this));
    this.refInput.addEventListener('keydown', CreateMergeRequestDropdown.processTab.bind(this));
    this.refInput.addEventListener('blur', this.clearRefHint.bind(this));
  }

  checkAbilityToCreateBranch() {
    return $.ajax({
      type: 'GET',
      dataType: 'json',
      url: this.canCreatePath,
      beforeSend: () => this.setUnavailableButtonState(),
    })
    .done((data) => {
      this.setUnavailableButtonState(false);

      if (data.can_create_branch) {
        this.available();
        this.enable();

        if (!this.droplabInitialized) {
          this.droplabInitialized = true;
          this.initDroplab();
          this.bindEvents();
        }
      } else if (data.has_related_branch) {
        this.hide();
      }
    }).fail(() => {
      this.unavailable();
      this.disable();
      new Flash('Failed to check if a new branch can be created.');
    });
  }

  clearRefHint() {
    this.refInput.value = this.refInput.value.slice(0, this.refInput.selectionStart) +
      this.refInput.value.slice(this.refInput.selectionEnd);
  }

  createBranch() {
    return $.ajax({
      method: 'POST',
      dataType: 'json',
      url: this.createBranchPath,
      beforeSend: () => (this.isCreatingBranch = true),
    })
    .done((data) => {
      this.branchCreated = true;
      window.location.href = data.url;
    })
    .fail(() => new Flash('Failed to create a branch for this issue. Please try again.'));
  }

  createMergeRequest() {
    return $.ajax({
      method: 'POST',
      dataType: 'json',
      url: this.createMrPath,
      beforeSend: () => (this.isCreatingMergeRequest = true),
    })
    .done((data) => {
      this.mergeRequestCreated = true;
      window.location.href = data.url;
    })
    .fail(() => new Flash('Failed to create Merge Request. Please try again.'));
  }

  disable() {
    this.disableCreateAction();

    this.dropdownToggle.classList.add('disabled');
    this.dropdownToggle.setAttribute('disabled', 'disabled');
  }

  disableCreateAction() {
    this.createMergeRequestButton.classList.add('disabled');
    this.createMergeRequestButton.setAttribute('disabled', 'disabled');

    this.createTargetButton.classList.add('disabled');
    this.createTargetButton.setAttribute('disabled', 'disabled');
  }

  enable() {
    this.createMergeRequestButton.classList.remove('disabled');
    this.createMergeRequestButton.removeAttribute('disabled');

    this.createTargetButton.classList.remove('disabled');
    this.createTargetButton.removeAttribute('disabled');

    this.dropdownToggle.classList.remove('disabled');
    this.dropdownToggle.removeAttribute('disabled');
  }

  static findByValue(objects, ref, returnFirstMatch = false) {
    if (!objects || !objects.length) return false;
    if (objects.indexOf(ref) > -1) return ref;
    if (returnFirstMatch) return objects.find(item => new RegExp(`^${ref}`).test(item));

    return false;
  }

  getDroplabConfig() {
    return {
      addActiveClassToDropdownButton: true,
      InputSetter: [
        {
          input: this.createMergeRequestButton,
          valueAttribute: 'data-value',
          inputAttribute: 'data-action',
        },
        {
          input: this.createMergeRequestButton,
          valueAttribute: 'data-text',
        },
        {
          input: this.createTargetButton,
          valueAttribute: 'data-value',
          inputAttribute: 'data-action',
        },
        {
          input: this.createTargetButton,
          valueAttribute: 'data-text',
        },
      ],
    };
  }

  getRef(ref, target = 'all') {
    if (!ref) return false;

    return $.ajax({
      method: 'GET',
      dataType: 'json',
      url: this.refsPath + ref,
      beforeSend: () => {
        this.isGettingRef = true;
      },
    })
    .always(() => {
      this.isGettingRef = false;
    })
    .done((data) => {
      const branches = data[Object.keys(data)[0]];
      const tags = data[Object.keys(data)[1]];
      let result;

      if (target === 'branch') {
        result = CreateMergeRequestDropdown.findByValue(branches, ref);
      } else {
        result = CreateMergeRequestDropdown.findByValue(branches, ref, true) ||
          CreateMergeRequestDropdown.findByValue(tags, ref, true);
      }

      return this.updateInputState(target, ref, result);
    })
    .fail(() => {
      this.unavailable();
      this.disable();
      new Flash('Failed to get ref.');

      return false;
    });
  }

  getTargetData(target) {
    return {
      input: this[`${target}Input`],
      message: this[`${target}Message`],
    };
  }

  hide() {
    this.wrapperEl.classList.add('hide');
  }

  init() {
    this.checkAbilityToCreateBranch();
  }

  initDroplab() {
    this.droplab = new DropLab();

    this.droplab.init(this.dropdownToggle, this.dropdownList, [InputSetter],
      this.getDroplabConfig());
  }

  isBusy() {
    return this.isCreatingMergeRequest ||
      this.mergeRequestCreated ||
      this.isCreatingBranch ||
      this.branchCreated ||
      this.isGettingRef;
  }

  onChangeInput(event) {
    let target;
    let value;

    if (event.srcElement === this.branchInput) {
      target = 'branch';
      value = this.branchInput.value;
    } else if (event.srcElement === this.refInput) {
      target = 'ref';
      value = event.srcElement.value.slice(0, event.srcElement.selectionStart) +
        event.srcElement.value.slice(event.srcElement.selectionEnd);
    } else {
      return false;
    }

    if (this.isGettingRef) return false;

    // `ENTER` key submits the data.
    if (event.keyCode === 13 && this.inputsAreValid) {
      event.preventDefault();
      return this.createMergeRequestButton.click();
    }

    // If the input is empty, use the original value generated by the backend.
    if (!value) {
      this.createBranchPath = this.wrapperEl.dataset.createBranchPath;
      this.createMrPath = this.wrapperEl.dataset.createMrPath;
      this.inputsAreValid = true;
      this.enable();
      this.showAvailableMessage(target);
      return true;
    }

    this.showCheckingMessage(target);
    this.refDebounce(value, target);

    return true;
  }

  onClickCreateMergeRequestButton(e) {
    let xhr = null;
    e.preventDefault();

    if (this.isBusy()) {
      return;
    }

    if (e.target.dataset.action === CREATE_MERGE_REQUEST) {
      xhr = this.createMergeRequest();
    } else if (e.target.dataset.action === CREATE_BRANCH) {
      xhr = this.createBranch();
    }

    xhr.fail(() => {
      this.isCreatingMergeRequest = false;
      this.isCreatingBranch = false;
    });

    xhr.always(() => this.enable());

    this.disable();
  }

  onClickSetFocusOnBranchNameInput() {
    this.branchInput.focus();
  }

  // `TAB` autocompletes the source.
  static processTab(event) {
    if (event.keyCode !== 9) return;

    event.preventDefault();
    window.getSelection().removeAllRanges();
  }

  removeMessage(target) {
    const { input, message } = this.getTargetData(target);
    const inputClasses = ['gl-field-error-outline', 'gl-field-success-outline'];
    const messageClasses = ['gl-field-hint', 'gl-field-error-message', 'gl-field-success-message'];

    inputClasses.forEach(cssClass => input.classList.remove(cssClass));
    messageClasses.forEach(cssClass => message.classList.remove(cssClass));
    message.style.display = 'none';
  }

  setUnavailableButtonState(isLoading = true) {
    if (isLoading) {
      this.unavailableButtonArrow.classList.add('fa-spin');
      this.unavailableButtonArrow.classList.add('fa-spinner');
      this.unavailableButtonArrow.classList.remove('fa-exclamation-triangle');
      this.unavailableButtonText.textContent = __('Checking branch availability...');
    } else {
      this.unavailableButtonArrow.classList.remove('fa-spin');
      this.unavailableButtonArrow.classList.remove('fa-spinner');
      this.unavailableButtonArrow.classList.add('fa-exclamation-triangle');
      this.unavailableButtonText.textContent = __('New branch unavailable');
    }
  }

  showAvailableMessage(target) {
    const { input, message } = this.getTargetData(target);
    const text = target === 'branch' ? 'branch name' : 'source';

    this.removeMessage(target);
    input.classList.add('gl-field-success-outline');
    message.classList.add('gl-field-success-message');
    message.textContent = sprintf(__('%{text} is available'), { text });
    message.style.display = 'inline-block';
  }

  showCheckingMessage(target) {
    const { message } = this.getTargetData(target);
    const text = target === 'branch' ? __('branch name') : __('source');

    this.removeMessage(target);
    message.classList.add('gl-field-hint');
    message.textContent = sprintf(__('Checking %{text} availability…'), { text });
    message.style.display = 'inline-block';
  }

  showNotAvailableMessage(target) {
    const { input, message } = this.getTargetData(target);
    const text = target === 'branch' ? __('Branch is already taken') : __('Source is not available');

    this.removeMessage(target);
    input.classList.add('gl-field-error-outline');
    message.classList.add('gl-field-error-message');
    message.textContent = text;
    message.style.display = 'inline-block';
  }

  unavailable() {
    this.availableButton.classList.add('hide');
    this.unavailableButton.classList.remove('hide');
  }

  updateInputState(target, ref, result) {
    // If a found branch equals exact the same as a user typed,
    // that means a new branch cannot be created as it is already exists.
    if (ref === result) {
      if (target === 'branch') {
        this.inputsAreValid = false;
        this.disableCreateAction();
        this.showNotAvailableMessage('branch');
      } else {
        this.inputsAreValid = true;
        this.enable();
        this.showAvailableMessage('ref');
        this.createBranchPath = this.createBranchPath.replace(this.regexps.ref.createBranchPath, `$1${ref}`);
        this.createMrPath = this.createMrPath.replace(this.regexps.ref.createMrPath, `$1${ref}`);
      }
    } else if (target === 'branch') {
      this.inputsAreValid = true;
      this.enable();
      this.showAvailableMessage('branch');
      this.createBranchPath = this.createBranchPath.replace(this.regexps.branch.createBranchPath, `$1${ref}`);
      this.createMrPath = this.createMrPath.replace(this.regexps.branch.createMrPath, `$1${ref}`);
    } else {
      this.inputsAreValid = false;
      this.disableCreateAction();
      this.showNotAvailableMessage('ref');

      // Show ref hint.
      if (result) {
        this.refInput.value = result;
        this.refInput.setSelectionRange(ref.length, result.length);
      }
    }
  }
}
