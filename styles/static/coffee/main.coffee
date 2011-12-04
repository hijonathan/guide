$ ->
    # GOAL: Interact with the contents of an iframe, 
    # passing selected DOM elements back to parent document

    # Define some utility functions first...

    get_dom_details = (target) ->
        return [
            this.tagName.toLowerCase(),
            if this.id then '#' + this.id else '', 
            if this.className then '.' + this.className.replace(' ', '.') else ''
        ].join('')

    get_dom_chain = (target, separator, scope) ->
        if (separator is null)
            separator = ' > '
        if (scope is null or not $(target).closest(scope).length)
            scope = 'body'

        return $(target).parentsUntil(scope).add(target)
            .map(get_dom_details).get()
            .join(separator)

    target_list = $('.dom-selections ul')

    # Downgrade domain to root (stripping subdomains)

    document.domain = 'jshell.net'

    # Define function on parent window for iframe to interface with

    window.list_dom_selection = (target) ->
        target_list.append('<li>' + get_dom_chain(target) + ' [' + $(target).text() + ']</li>')
