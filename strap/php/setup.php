<?php

/**
 * @file
 * Setup PHP.
 */

locale_add_language('fr');

module_load_include('inc', 'locale', 'locale.admin');
$form_state = array();
$form_state['values']['language']['enabled']['locale-url'] = 1;
$form_state['values']['language_content']['enabled']['locale-url'] = 1;
$form_state['values']['op'] = 'Save settings';
drupal_form_submit('locale_languages_configure_form', $form_state);
