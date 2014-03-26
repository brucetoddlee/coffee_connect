// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require handlebars.runtime
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-resource
//= require_tree .

var formHelper = (function(_csrf_token){
	function tokenTag() {
	  return $('<input name="authenticity_token" type="hidden" value="' + _csrf_token + '">')
	}

	return {
		fieldFor: function($form, name, key, val){
			var formField = '<input type="hidden" name="' + name + '[' + key + ']" value="' + val + '">'
			$form.append(formField)
			return $form;
		},

		formFor: function(action, method, name, data){
			var $form = $("<form id='new_"+name+"' action='"+action+"' method='"+method+"'></form>")
			$.each(data, function(key, val){
				$form = formHelper.fieldFor($form, name, key, val)
			})

			// ADD CSRF TOKEN TO FORM
			$form.append(tokenTag())

			return $form;
		}
	}	
})(gon._csrf_token)