
Stateless widgets
        |
        |  body child
        |
Stateful widgets  -- create instance -> State class 
(immutable)


### Widget

Widgets describe what their view should look like with current configuration and state.
 -> you build your UI out of widgets.
 -> When a widget’s state changes, the widget rebuilds its description, which the framework diffs against the previous description in order to determine the minimal changes needed in the underlying render tree to transition from one state to the next.

### State
The information that
    1) can be read synchronously when the widget is built
    2) might change during the lifetime of the widget.

### StatefulWidget class
A widget that has mutable state.

### Route


### MaterialPageRoute