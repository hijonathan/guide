
  $(function() {
    var get_dom_chain, get_dom_details, target_list;
    get_dom_details = function(target) {
      return [this.tagName.toLowerCase(), this.id ? '#' + this.id : '', this.className ? '.' + this.className.replace(' ', '.') : ''].join('');
    };
    get_dom_chain = function(target, separator, scope) {
      if (separator === null) separator = ' > ';
      if (scope === null || !$(target).closest(scope).length) scope = 'body';
      return $(target).parentsUntil(scope).add(target).map(get_dom_details).get().join(separator);
    };
    target_list = $('.dom-selections ul');
    document.domain = 'jshell.net';
    return window.list_dom_selection = function(target) {
      return target_list.append('<li>' + get_dom_chain(target) + ' [' + $(target).text() + ']</li>');
    };
  });
