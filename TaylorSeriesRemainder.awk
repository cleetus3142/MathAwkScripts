# Computes the Lagrange remainder for a Taylor series of
# n terms. This for the Taylor series expansion of cos(x)
#                             (n+1)  (n=1)
#                          f(z)  |x-a|
# in genereal  Rn <=  ----------------------
#                             (n+1)!
#
# Rn -> The remainder
# a -> Where the series is expanded.
# x -> Where the remainder is evaluated
#        (n+1)
#     f(z)    -> z is between x and a and so chosen that the n=1
# derivative is the largest value.
#
# In the case below, the remainder is for cos(x) or
#
#                                 2     4      6
#                                x     x      x 
#                cos(x) =  1 -  --- + --- +  ---
#                                2    24     720
#  here a = 0


BEGIN { digits = "^[0-9]+$" 
        print "Enter a value for n, the numbder of terms in the Taylor Series"
}

function factorial(n) {
    f=1
    while (n > 0) {
        f=f*n
        n--
    }
    return f
}

{
    if ($1 ~ digits){
        ans = 1.0*(3.14)^($1+1)/factorial($1+1)
        print "The remainder is:", ans
        }
    else
        print "You must use an integer"
}
