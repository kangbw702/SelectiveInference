f1 <- function(x, parm){ parm[3] * (abs(x-parm[1])<parm[2]) + parm[4]*(abs(x-parm[1])>=parm[2]) }

#' Data generating function
#'
#' @params N A number of total observations.
#' @params nu A vector of length 2.
#' @params f A integer specify which type of function to use.
#' @return A list of x, nu and H
#' @export
#' @examples
#' generate_data(1e4, c(0, 1), c(0,50,0.9,0.1))
generate_data <- function(N,
                          nu,
                          f_param # need to check for validity
){
    x_i <- seq(-100, 100, length.out = N)
    
    # To Do: add more types of functions
    # f_pi_1 <- partial(
    #     switch(f, f1, f2), 
    #     parm = f_param)
    f_pi_1 <-f1
    
    pi_1 <- f_pi_1(x_i, parm = f_param)
    cat(pi_1)
    H_i <- rbinom(N, 1, pi_1)
    
    nu_i <- rep(nu[1], N)
    nu_i[H_i==1] <- nu[2]
    
    return(list(x=x_i, nu=nu_i, H=H_i))
}

generate_data(1e4, c(0, 1), c(0,50,0.9,0.1))