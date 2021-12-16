import { Controller } from "stimulus"
import $ from 'jquery';

require("select2/dist/css/select2")
require("select2-bootstrap-theme/dist/select2-bootstrap")

import Select2 from "select2"

export default class extends Controller {
  connect() {
    $('.select2').select2({tags: true});
  }
}