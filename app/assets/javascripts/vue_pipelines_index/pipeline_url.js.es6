/* global Vue, gl */
/* eslint-disable no-param-reassign */

((gl) => {
  gl.VuePipelineUrl = Vue.extend({
    props: [
      'pipeline',
    ],
    computed: {
      user() {
        if (this.pipeline.user) return true;
        return false;
      },
    },
    template: `
      <td>
        <a :href='pipeline.url'>
          <span class="pipeline-id">#{{pipeline.id}}</span>
        </a>
        <span>by</span>
        <a
          v-if='user'
          :href='pipeline.user.web_url'
        >
          <img
            v-if='user'
            class="avatar has-tooltip s20 "
            :title='pipeline.user.name'
            data-container="body"
            :src='pipeline.user.avatar_url'
          >
        </a>
        <span
          v-if='!user'
          class="api monospace"
        >
          API
        </span>
        <span
          v-if='pipeline.flags.latest === true'
          class="label label-success has-tooltip"
          title=""
          data-original-title="Latest pipeline for this branch"
        >
          latest
        </span>
        <span
          v-if='pipeline.flags.yaml_errors === true'
          class="label label-danger has-tooltip"
          title=""
          data-original-title="Undefined yaml error"
        >
          yaml invalid
        </span>
        <span
          v-if='pipeline.flags.stuck === true'
          class="label label-warning"
        >
          stuck
        </span>
      </td>
    `,
  });
})(window.gl || (window.gl = {}));
