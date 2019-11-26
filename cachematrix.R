

makeCacheMatrix <- function(x = matrix()) {
}



cacheSolve <- function(x, ...) {
  }
  data <- x$get()
  ## Using matrix multiplication to get the inverse
  x <- solve(data) %*% data
  x$setInverse(x)
  # return the matrix
  x
}
