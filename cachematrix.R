## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it 
## repeatedly. This script contains a pair of functions that cache the 
## inverse of a matrix.



## This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(solve) m <<- solve
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
    
}



## This function computes the inverse of the special "matrix" returned by 
## CacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the chaceSolve should retrieve the inverse 
## from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setmean(m)
    m

}

## Code appears to be fully functional now

