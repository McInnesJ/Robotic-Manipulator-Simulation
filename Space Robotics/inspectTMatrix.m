function vector = inspectTMatrix(tMatrix, desiredVector)
%Parses the t-matrix to extract values for the n,s,a,p.
    if desiredVector == 'n'
        vector = getNVector(tMatrix);
        
    elseif desiredVector == 's'
        vector = getSVector(tMatrix);
        
    elseif desiredVector == 'a'
        vector = getAVector(tMatrix);
        
    elseif desiredVector == 'p'
        vector = getPVector(tMatrix);
        
    else
        throw(exception);
    end

end

function nVector = getNVector(tMatrix)
    nVector = [tMatrix(1,1),tMatrix(2,1),tMatrix(3,1)]';
end
function sVector = getSVector(tMatrix)
    sVector = [tMatrix(1,2),tMatrix(2,2),tMatrix(3,2)]';
end
function aVector = getAVector(tMatrix)
    aVector = [tMatrix(1,3),tMatrix(2,3),tMatrix(3,3)]';
end
function pVector = getPVector(tMatrix)
    pVector = [tMatrix(1,4),tMatrix(2,4),tMatrix(3,4)]';
end

