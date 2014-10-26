## Methods
## The functions attempt to cache matrix objects whose who inverse has been calulated and only
## calculates the inverse where it has not been cached . ie. first time calculations.

## This function is a matrix type object with additional methods

makeCacheMatrix <- function(x = matrix()) {

	i <- NULL
        
	

        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list( get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This method caches and calculate the inverse of a matrix where not calcualted

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	
	i <- x$getinverse()
	if(!is.null(i)) {
                message("getting cached data")	
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i

}