
.. code:: r

    one <- c(1,1) 
    xval <- c(1,2) 
    yval <- c(2,5) 
    X <- matrix(c(one,xval),nrow=2,ncol=2) 
    Y <- matrix(c(yval),nrow=2,ncol=1)

.. code:: r

    solve(t(X) %*% X) %*% t(X) %*% Y 



.. raw:: html

    <table>
    <tbody>
    	<tr><td>-1</td></tr>
    	<tr><td> 3</td></tr>
    </tbody>
    </table>
    


.. code:: r

    one <- c(1,1,1) 
    x1val <- c(1,4,3) 
    x2val <- c(2,-1,1) 
    yval <- c(9,3,9) 
    
    X <- matrix(c(one,x1val,x2val),nrow=3,ncol=3) 
    Y <- matrix(c(yval),nrow=3,ncol=1)

.. code:: r

    solve(t(X) %*% X) %*% t(X) %*% Y



.. raw:: html

    <table>
    <tbody>
    	<tr><td>-1</td></tr>
    	<tr><td> 2</td></tr>
    	<tr><td> 4</td></tr>
    </tbody>
    </table>
    


.. code:: r

    one <- c(1,1,1) 
    
    xval <- c(1,2,3) 
    
    yval <- c(2,5,4) 
    
    X <- matrix(c(one,xval),nrow=3,ncol=2) 
    
    Y <- matrix(c(yval),nrow=3,ncol=1) 

.. code:: r

    solve(t(X) %*% X) %*% t(X) %*% Y



.. raw:: html

    <table>
    <tbody>
    	<tr><td>1.666667</td></tr>
    	<tr><td>1.000000</td></tr>
    </tbody>
    </table>
    


.. code:: r

    one <- c(1,1,1) 
    
    xval <- c(1,2,3) 
    
    yval <- c(2,5,4) 
    
    X <- matrix(c(one,xval),nrow=3,ncol=2) 
    
    Y <- matrix(c(yval),nrow=3,ncol=1) 

.. code:: r

    betahat = solve(t(X) %*% X) %*% t(X) %*% Y 
    betahat



.. raw:: html

    <table>
    <tbody>
    	<tr><td>1.666667</td></tr>
    	<tr><td>1.000000</td></tr>
    </tbody>
    </table>
    


.. code:: r

    SSE = t(Y) %*% Y - t(betahat) %*% t(X) %*% Y 
    SSE



.. raw:: html

    <table>
    <tbody>
    	<tr><td>2.666667</td></tr>
    </tbody>
    </table>
    


.. code:: r

    x <- c(3,5,7,9) 
    y <- c(17,23,41,50) 
    
    t_line = lm(y ~ x) 
    t_line
    



.. parsed-literal::

    
    Call:
    lm(formula = y ~ x)
    
    Coefficients:
    (Intercept)            x  
          -2.35         5.85  
    


.. code:: r

    coeffs = coefficients(t_line)
    b0 = coeffs[1] 
    b1 = coeffs[2] 
    yhat = b1 * x + b0
    sum((y-yhat)^2)



.. raw:: html

    24.3


.. code:: r

    tsum = sum((y-mean(y))^2)
    tsum



.. raw:: html

    708.75


.. code:: r

    n = length(x)
    df = n - 2
    se = sqrt(sum((y-yhat)^2)/df)
    se



.. raw:: html

    3.48568501158668


.. code:: r

    tsum = sum((x-mean(x))^2)
    tsum 



.. raw:: html

    20


.. code:: r

    clevel=.95
    atl = clevel + (1 - clevel)/2 
    t = qt(atl,df)
    t



.. raw:: html

    4.30265272974946


.. code:: r

    lb = b1 - t * se/sqrt(tsum) 
    ub = b1 + t * se/sqrt(tsum) 
    lb 
    ub



.. raw:: html

    <strong>x:</strong> 2.49641408913705



.. raw:: html

    <strong>x:</strong> 9.20358591086295


.. code:: r

    library(evir)
    data(danish)
    length(danish)
    



.. raw:: html

    2167


.. code:: r

    emplot(danish) 
    



.. image:: output_17_0.png


.. code:: r

    emplot(danish, alog="xy")
    



.. image:: output_18_0.png


.. code:: r

    meplot(danish, omit=5)
    



.. image:: output_19_0.png


.. code:: r

    meplot(bmw, omit=5)



.. image:: output_20_0.png


.. code:: r

    meplot(siemens, omit=5)



.. image:: output_21_0.png


.. code:: r

    tp <- tailplot(gpdfittedparameters)
    gpd.q(tp, pp = 0.999, ci.p = 0.95)



.. raw:: html

    <dl class=dl-horizontal>
    	<dt>Lower CI</dt>
    		<dd>63.2784325644593</dd>
    	<dt>Estimate</dt>
    		<dd>102.182255843829</dd>
    	<dt>Upper CI</dt>
    		<dd>310.687680096456</dd>
    </dl>
    



.. image:: output_22_1.png


.. code:: r

    tp <- tailplot(gpdfittedparameters)
    gpd.q(tp, pp = 0.99)
    gpd.sfall(tp, 0.99)



.. raw:: html

    <dl class=dl-horizontal>
    	<dt>Lower CI</dt>
    		<dd>23.4401636965386</dd>
    	<dt>Estimate</dt>
    		<dd>25.8451037628292</dd>
    	<dt>Upper CI</dt>
    		<dd>29.7958674409946</dd>
    </dl>
    



.. raw:: html

    <dl class=dl-horizontal>
    	<dt>Lower CI</dt>
    		<dd>42.1610622858709</dd>
    	<dt>Estimate</dt>
    		<dd>68.9846266348609</dd>
    	<dt>Upper CI</dt>
    		<dd>394.875549048316</dd>
    </dl>
    



.. image:: output_23_2.png

