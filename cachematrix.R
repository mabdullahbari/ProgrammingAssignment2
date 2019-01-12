## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y # it caches y argument and set to special envir by <<- 
    inv <<- NULL # it clears out previous inverted values
  }
  get <- function() x #gets cached value
  setInverse <- function(inverse) inv <<- inverse # saves inverted values to envir via <<-
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse() ##gets cached inverse via passed in function makeCacheMatrix, and assigned to inv
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
