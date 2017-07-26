function W = makeWorkspace(linkPos,platSize,jointLims,detail)
%Function to generate all the points on the workspace of the manipulator

fOSTerm = sqrt(max(linkPos(:)));
x = linspace(-max(linkPos(1,:))-fOSTerm,max(linkPos(1,:))+fOSTerm,detail);
y = linspace(-max(linkPos(2,:))-fOSTerm,max(linkPos(2,:))+fOSTerm,detail);

tMin=jointLims(1,1); tMax=jointLims(1,2);
dMin=jointLims(2,1); dMax=jointLims(2,2);

k=1;
for i=1:numel(x)
    for j=1:numel(y)
        eePos = [x(i),y(j),0];
        jointVars = iKinSolve(linkPos,platSize,eePos);
        tVec = abs(jointVars(1,:));
        dVec = jointVars(2,:);
        if(min(dVec)>=dMin && max(dVec)<=dMax)
            if(min(tVec)>=tMin && max(tVec)<=tMax)
                W(k,:) = [x(i),y(j)];%#ok<AGROW>
                k=k+1;
            end
        end
    end
end


end