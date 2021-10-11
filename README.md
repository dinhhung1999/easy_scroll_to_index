# easy_scroll_to_index

A new Flutter package support scroll to index for Listview, Gridview and NestedScrollView


Author: DinhVanHung
### Demo

<table>
  <tr>
    <td><img src="https://github.com/dinhhung1999/easy_scroll_to_index/blob/main/demo/demo.gif" alt="Scroll to index vertical" width="300" height="540"></td>
    <td><img src="https://github.com/dinhhung1999/easy_scroll_to_index/blob/main/demo/demo-horizontal.gif" alt="Scroll to index horizontal" width="300"height="540"></td>
  
  </tr>
</table>
Example:

### Display on UI

To display on UI, currently you can use `EasyScrollToIndex`.

Example:
- vertical
```     
          final ScrollToIndexController _controller = ScrollToIndexController();

          EasyScrollToIndex(
              controller: _controller,            // ScrollToIndexController
              itemCount: 100,                     // itemCount
              itemWidth: 50,
              itemHeight: 100,
              itemBuilder: (BuildContext context, int index) {
               return Container(
                 width: 50,
                 height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1),
                  ),
                  child: Center(child: Text('item '+ index.toString())),
                );
              },
            ),

```

- horizontal

```
            final ScrollToIndexController _controller = ScrollToIndexController();
            
            EasyScrollToIndex(
              controller: _controller,            // ScrollToIndexController
              scrollDirection: Axis.horizontal,   // default Axis.vertical
              itemCount: 100,                     // itemCount
              itemWidth: 50,
              itemHeight: 100,
              itemBuilder: (BuildContext context, int index) {
               return Container(
                 width: 50,
                 height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1),
                  ),
                  child: Center(child: Text('item '+ index.toString())),
                );
              },
            ),
```

- scroll to index:
```
          _controller.easyScrollToIndex(index: 50);
```

