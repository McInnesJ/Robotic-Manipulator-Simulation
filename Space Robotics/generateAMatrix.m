function aMatrix = generateAMatrix(theta, alpha, link, offset )

    cT = cos(theta);
    sT = sin(theta);
    cA = cos(alpha); %this is returnin non zero on alpha = 90. May consider rounding down. 
    sA = sin(alpha);
    a = link;
    d = offset;
    
    aMatrix = [cT, -(cA*sT), sA*sT, a*cT;
        sT, cA*cT, -(sA*cT), a*sT;
        0, sA, cA, d;
        0, 0, 0, 1];
    


end

