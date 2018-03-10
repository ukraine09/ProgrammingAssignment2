
#This is second programming assignment for R-programming course in Data Science specialization

# Here I create a pair of functions that cache the inverse of a matrix 


## First function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(z){
    x <<- z
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(solveMatrix) inv <<- solveMatrix
  getInverse <- function() inv
  list(set = set, 
       get = get, 
       setInverse = setInverse, 
       getInverse = getInverse)
}

##Second function computes the inverse of the special “matrix” returned by first function.

cacheSolve <- function(x, ...) {
  
  inv <- x$getInverse()   ## Return a matrix that is the inverse of 'x'
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  mydata <- x$get()
  inv <- solve(mydata)
  x$setInverse(inv)
  inv      
}
