import "phoenix_html";
import { Socket } from "phoenix";
import LiveSocket from "phoenix_live_view";

import { create_code_editor } from "./code-editor";

import "../css/app.css";

const form = document.getElementById("configuration-form");
const code_editor = document.getElementById("code-editor");

const code_validation_output = document.getElementById("code_validation_output");

create_code_editor(code_editor, form, form && form.elements["dsl"], code_validation_output, 1000);

const is_in_iframe = window !== window.parent;

if (is_in_iframe) {
  document.body.classList.add("iframe");
}

const hooks = {
  Log: {
    mounted() {
      this.logScrolling = true;
      this.el.scrollTop = this.el.scrollHeight - this.el.clientHeight;

      this.el.addEventListener("scroll", () => {
        this.logScrolling = this.el.scrollTop > this.el.scrollHeight - this.el.clientHeight - 32;
      });
    },
    updated() {
      if (this.logScrolling) {
        this.el.scrollTop = this.el.scrollHeight - this.el.clientHeight;
      }
    }
  }
};

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/ws/live", Socket, { hooks, params: { _csrf_token: csrfToken } });
liveSocket.connect();

window.liveSocket = liveSocket;
