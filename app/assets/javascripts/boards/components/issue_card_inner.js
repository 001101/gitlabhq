import Vue from 'vue';
import eventHub from '../eventhub';

(() => {
  const Store = gl.issueBoards.BoardsStore;

  window.gl = window.gl || {};
  window.gl.issueBoards = window.gl.issueBoards || {};

  gl.issueBoards.IssueCardInner = Vue.extend({
    props: {
      issue: {
        type: Object,
        required: true,
      },
      issueLinkBase: {
        type: String,
        required: true,
      },
      list: {
        type: Object,
        required: false,
        default: {},
      },
      rootPath: {
        type: String,
        required: true,
      },
      updateFilters: {
        type: Boolean,
        required: false,
        default: false,
      },
    },
    methods: {
      showLabel(label) {
        if (!this.list) return true;

        return !this.list.label || label.id !== this.list.label.id;
      },
      filterByLabel(label, e) {
        if (!this.updateFilters) return;

        const filterPath = gl.issueBoards.BoardsStore.filter.path.split('&');
        const labelTitle = encodeURIComponent(label.title);
        const param = `label_name[]=${labelTitle}`;
        const labelIndex = filterPath.indexOf(param);
        $(e.currentTarget).tooltip('hide');

        if (labelIndex === -1) {
          filterPath.push(param);
        } else {
          filterPath.splice(labelIndex, 1);
        }

        gl.issueBoards.BoardsStore.filter.path = filterPath.join('&');

        Store.updateFiltersUrl();

        eventHub.$emit('updateTokens');
      },
      labelStyle(label) {
        return {
          backgroundColor: label.color,
          color: label.textColor,
        };
      },
    },
    template: `
      <div>
        <div class="card-header">
          <i class="fa fa-eye-slash confidential-icon"
            v-if="issue.confidential"
            aria-hidden="true">
          </i>
          <h4 class="card-title">
            <a :href="issueLinkBase + '/' + issue.id"
              :title="issue.title">{{ issue.title }}</a>
            <span class="card-number">#{{ issue.id }}</span>
          </h4>
          <a class="card-assignee has-tooltip"
            :href="rootPath + issue.assignee.username"
            :title="'Assigned to ' + issue.assignee.name"
            v-if="issue.assignee"
            data-container="body">
            <img class="avatar avatar-inline s20"
              :src="issue.assignee.avatar"
              width="20"
              height="20"
              :alt="'Avatar for ' + issue.assignee.name" />
          </a>
        </div>
        <div class="card-footer">
          <button
            class="label color-label has-tooltip"
            v-for="label in issue.labels"
            type="button"
            v-if="showLabel(label)"
            @click="filterByLabel(label, $event)"
            :style="labelStyle(label)"
            :title="label.description"
            data-container="body">
            {{ label.title }}
          </button>
        </div>
      </div>
    `,
  });
})();
