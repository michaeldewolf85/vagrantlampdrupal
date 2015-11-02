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

// Configure Internationalization for Nodes.
foreach (node_type_get_types() as $node_type) {
  variable_set("language_content_type_{$node_type->type}", 4);
}

$lang_vars = array('language_negotiation_language', 'language_negotiation_language_content', 'language_negotiation_language_url');
foreach ($lang_vars as $key) {
  $var = variable_get($key);
  $var['locale-url']['callbacks']['language'] = 'dakine_language_from_url';
  $var['locale-url']['file'] = drupal_get_path('module', 'dakine_lang') . '/dakine_lang.module';
  variable_set($key, $var);
}
