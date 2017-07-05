setClass('task',
         slots = c(
             what = 'character',
             when = 'Date',
             priority = 'character')
         )
 createTask <- function(what, when, priority){
    new('task',
        what = what,
        when = as.Date(when),
        priority = priority)
    }
    
valida <- function (object) {
    if (any(sapply(object@tasks,
                   function(x) !is(x, "task")))) 
        stop("not a list of task objects")
    return(TRUE)
}

setClass('ToDo',
         slots = c(tasks = 'list'),
         validity=valida
         )
createToDo <- function(){
    new('ToDo')
}

addTask <- function(object, task){
    ## La siguiente comprobación sólo es necesaria si la
    ## definición de la clase *no* incorpora una función 
    ## validity
    stopifnot(is(task,'task'))
    object@tasks <- c(object@tasks, task)
    object
}
