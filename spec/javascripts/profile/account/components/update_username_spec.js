import Vue from 'vue';
import axios from '~/lib/utils/axios_utils';
import MockAdapter from 'axios-mock-adapter';

import updateUsername from '~/profile/account/components/update_username.vue';
import mountComponent from 'spec/helpers/vue_mount_component_helper';

describe('UpdateUsername component', () => {
  const rootUrl = gl.TEST_HOST;
  const actionUrl = `${gl.TEST_HOST}/update/username`;
  const username = 'hasnoname';
  let Component;
  let vm;
  let mock;

  beforeEach(done => {
    mock = new MockAdapter(axios);
    Component = Vue.extend(updateUsername);
    vm = mountComponent(Component, {
      actionUrl,
      rootUrl,
      initialUsername: username,
    });

    vm.isOpen = true;

    Vue.nextTick()
      .then(done)
      .catch(done.fail);
  });

  afterEach(() => {
    vm.$destroy();
    mock.restore();
  });

  const findElements = () => ({
    input: vm.$el.querySelector('#modal-username-change-input'),
    openModalBtn: vm.$el.querySelector('[data-target="#modal-username-change-confirmation"]'),
    modal: vm.$el.querySelector('#modal-username-change-confirmation'),
    confirmModalBtn: vm.$el.querySelector('#modal-username-change-confirmation .btn-warning'),
  });

  it('has a disabled button if the username was not changed', done => {
    const { input, openModalBtn, modal } = findElements();
    input.dispatchEvent(new Event('input'));

    Vue.nextTick()
      .then(() => {
        expect(vm.username).toBe(username);
        expect(vm.newUsername).toBe(input.value);
        expect(openModalBtn).toHaveAttr('disabled', 'disabled');
        openModalBtn.click();
        expect(modal).toBeHidden();
      })
      .then(done)
      .catch(done.fail);
  });

  it('has an enabled button which if the username was changed', done => {
    const { input, openModalBtn } = findElements();
    input.value = 'anything';
    input.dispatchEvent(new Event('input'));

    Vue.nextTick()
      .then(() => {
        expect(vm.username).toBe(username);
        expect(vm.newUsername).toBe(input.value);
        expect(openModalBtn).not.toHaveAttr('disabled', 'disabled');
      })
      .then(done)
      .catch(done.fail);
  });

  it('sends a put request when confirming the username change', done => {
    mock.onPut(actionUrl).reply(() => [200, { message: 'Username changed' }]);

    const newUsername = 'anything';

    const { input, openModalBtn, confirmModalBtn } = findElements();
    input.value = newUsername;
    input.dispatchEvent(new Event('input'));

    Vue.nextTick()
      .then(() => {
        expect(vm.username).toBe(username);
        expect(vm.newUsername).toBe(newUsername);
        expect(openModalBtn).not.toHaveAttr('disabled', 'disabled');
        confirmModalBtn.click();
      })
      .then(Vue.nextTick)
      .then(Vue.nextTick)
      .then(() => {
        expect(vm.username).toBe(newUsername);
        expect(vm.newUsername).toBe(newUsername);
      })
      .then(done)
      .catch(done.fail);
  });
});
