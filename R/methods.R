setGeneric('print')

setMethod('print', signature = 'task',
          definition = function(x, ...){
              cat('What: ', x@what,
                  '- When:', as.character(x@when),
                  '- Priority:', x@priority,
                  '\n')
          })
 setMethod('print', signature='ToDo',
          definition = function(x, ...){
              cat('This is my ToDo list:\n')
              tasksList <- x@tasks
              for (i in seq_along(tasksList)) {
                  cat('No.', i, ':')
                  print(tasksList[[i]])
              }
              cat('--------------------\n')
          })
