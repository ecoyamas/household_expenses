// Loads all Semantic javascripts
//= require semantic-ui

$('.ui.sidebar').sidebar({
  context: $('.bottom.segment')
})
.sidebar('attach events', '.menu .item');