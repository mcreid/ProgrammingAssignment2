## Caching the inverse of a matrix to avoid recalculating every time.

## Sets the matrix, gets the matrix, sets the inverse of the matrix, gets the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Pulls up inverted matrix from above function if already cached, if not, inverts matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)) {
  message("getting chached data")
  return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
