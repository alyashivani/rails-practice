// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap-icons/font/bootstrap-icons.css'
import 'core-js/stable'
import 'regenerator-runtime/runtime'


require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()


require('./nested-forms/addFields')
require('./nested-forms/removeFields')

$(document).on('turbolinks:load', function(){
	$(document).on('change', '.variant_select', function(){
		$.ajax({
		  url: "/admin/products/options_for_variant",
		  method: 'get',
		  data: {id: $(this).val(), attribute_select_id: $(this).parent().next().find('select').attr('id')}
		})
	})
})
