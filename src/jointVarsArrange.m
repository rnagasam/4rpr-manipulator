function jointVars = jointVarsArrange(knownJoints,solnVec)
%Function to 'arrange' the solution for jointVars from fKinSolve
% solnVec has size = 5
% knownJoints has size = [2 4]
% jointVars has size = [2 4]

% Construct scenarios
%    If scenario == 0, -> 3 prismatic
%    If scenario == 1, -> 1 revolute, 2 prismatic
%    If scenario == 2, -> 2 revolute, 1 prismatic
%    If scenario == 3, -> 3 revolute
sceneVec = knownJoints(1,:)<=4;
scenario = sum(sceneVec);

% Construct knownVars and knownVals
knownVars = zeros(1,8); knownVals = zeros(1,8);
knownVars(knownJoints(1,:)) = 1;
knownVals(knownJoints(1,:)) = knownJoints(2,:);
knownVars = reshape(knownVars,[4,2])';
knownVals = reshape(knownVals,[4,2])';

% Arrange solution
jointVars = zeros(2,4);
tCount = 1;
dCount = 1;
if (scenario == 3)
    for i=1:4
        if(knownVars(1,i)==1)
            jointVars(1,i)=knownVals(1,i);
        elseif(knownVars(1,i)==0)
            jointVars(1,i)=solnVec(1);
        end
        jointVars(2,i)=solnVec(i+1);
    end
elseif (scenario == 2)
    for i=1:4
        if(knownVars(1,i)==1 && knownVars(2,i)==1)
            jointVars(1,i)=knownVals(1,i);
            jointVars(2,i)=knownVals(2,i);
        elseif(knownVars(1,i)==1 && knownVars(2,i)==0)
            jointVars(1,i)=knownVals(1,i);
            jointVars(2,i)=solnVec(dCount+2);
            dCount=dCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==1)
            jointVars(1,i)=solnVec(tCount);
            jointVars(2,i)=knownVals(2,i);
            tCount=tCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==0)
            jointVars(1,i)=solnVec(tCount);
            jointVars(2,i)=solnVec(dCount+2);
            tCount=tCount+1;
            dCount=dCount+1;
        end
    end
elseif (scenario == 1)
    for i=1:4
        if(knownVars(1,i)==1 && knownVars(2,i)==1)
            jointVars(1,i)=knownVals(1,i);
            jointVars(2,i)=knownVals(2,i);
        elseif(knownVars(1,i)==1 && knownVars(2,i)==0)
            jointVars(1,i)=knownVals(1,i);
            jointVars(2,i)=solnVec(dCount+3);
            dCount=dCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==1)
            jointVars(1,i)=solnVec(tCount);
            jointVars(2,i)=knownVals(2,i);
            tCount=tCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==0)
            jointVars(1,i)=solnVec(tCount);
            jointVars(2,i)=solnVec(dCount+3);
            tCount=tCount+1;
            dCount=dCount+1;
        end
    end
elseif (scenario == 0)
    for i=1:4
        if(knownVars(2,i)==1)
            jointVars(2,i)=knownVals(2,i);
        elseif(knownVars(2,i)==0)
            jointVars(2,i)=solnVec(5);
        end
        jointVars(1,i)=solnVec(i);
    end
end


end



