## Functions using for caching the inverse of a matrix
## written by Zhen Y.

## The "makeCacheMatrix" function below is intended to create one special matrix object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse property
  theInverse <- NULL
  set <- function(matrix) {
    x <<- matrix
    theInverse <<- NULL
  }
  get <- function() {
    # Return the matrix
    x
  }
  setInverse <- function(inverse) {
    theInverse <<- inverse
  }
  getInverse <- function() {
    # Return the inverse property
    theInverse
  }
  ##create list using methods of get and set for the original matrix and
  ## its inverse
  list(
    set = set,
    get = get,
    setInverse = setInverse,
    getInverse = getInverse
  )
}


## This "cashesolve" function is intended to compute the inverse of the matrix
## returned above. In any cases, the inverse has been calculated already (and the
## matrix has not changed), the function can return the inverse from the cache

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of original matrix x
    x <- x$getInverse()
    ## Only returning the inverse if the inverse is already set
    if (!is.null(x)) {
      message("returning cached data")
      return(x)
    }
  data <- x$get()
  ## Using matrix multiplication to get the inverse
  x <- solve(data) %*% data
  x$setInverse(x)
  # return the matrix
  x
}
