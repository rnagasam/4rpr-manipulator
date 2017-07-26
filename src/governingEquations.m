function G = governingEquations(x,linkPos,platSize,knownJoints)
% Function to generate governing equations of 4RPR manipulator

% Preliminaries
%   - Geometry
[a3,delta] = callGeometry(platSize);

%   - Create scenarios
%       If scenario == 0, -> 3 prismatic
%       If scenario == 1, -> 1 revolute, 2 prismatic
%       If scenario == 2, -> 2 revolute, 1 prismatic
%       If scenario == 3, -> 3 revolute
sceneVec = knownJoints(1,:)<=4;
scenario = sum(sceneVec);

%   - Construct knownVars and knownVals
knownVars = zeros(1,8); knownVals = zeros(1,8);
knownVars(knownJoints(1,:)) = 1;
knownVals(knownJoints(1,:)) = knownJoints(2,:);
knownVars = reshape(knownVars,[4,2])';
knownVals = reshape(knownVals,[4,2])';

% Construct Equations
tCount = 1;
dCount = 1;
if (scenario == 3)
    for i=1:4
        if(knownVars(1,i)==1)
            G(i)=linkPos(1,i)+x(i+1)*cos(knownVals(1,i))-x(6)-a3*cos(...
                x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(i+1)*sin(knownVals(1,i))-x(7)-a3*sin(...
                x(8)+delta(i));%#ok<AGROW>
        elseif(knownVars(1,i)==0)
            G(i)=linkPos(1,i)+x(i+1)*cos(x(1))-x(6)-a3*cos(x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(i+1)*sin(x(1))-x(7)-a3*sin(x(8)+...
                delta(i));%#ok<AGROW>
        end
    end
elseif (scenario == 2)
    for i=1:4
        if(knownVars(1,i)==1 && knownVars(2,i)==1)
            G(i)=linkPos(1,i)+knownVals(2,i)*cos(knownVals(1,i))-x(6)-...
                a3*cos(x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+knownVals(2,i)*sin(knownVals(1,i))-x(7)-...
                a3*sin(x(8)+delta(i));%#ok<AGROW>
        elseif(knownVars(1,i)==1 && knownVars(2,i)==0)
            G(i)=linkPos(1,i)+x(dCount+2)*cos(knownVals(1,i))-x(6)-a3*...
                cos(x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(dCount+2)*sin(knownVals(1,i))-x(7)-a3*...
                sin(x(8)+delta(i));%#ok<AGROW>
            dCount=dCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==1)
            G(i)=linkPos(1,i)+knownVals(2,i)*cos(x(tCount))-x(6)-a3*cos(...
                x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+knownVals(2,i)*sin(x(tCount))-x(7)-a3*...
                sin(x(8)+delta(i));%#ok<AGROW>
            tCount=tCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==0)
            G(i)=linkPos(1,i)+x(dCount+2)*cos(x(tCount))-x(6)-a3*cos(...
                x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(dCount+2)*sin(x(tCount))-x(7)-a3*sin(...
                x(8)+delta(i));%#ok<AGROW>
            tCount=tCount+1;
            dCount=dCount+1;
        end
    end
elseif (scenario == 1)
    for i=1:4
        if(knownVars(1,i)==1 && knownVars(2,i)==1)
            G(i)=linkPos(1,i)+knownVals(2,i)*cos(knownVals(1,i))-x(6)-...
                a3*cos(x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+knownVals(2,i)*sin(knownVals(1,i))-x(7)-...
                a3*sin(x(8)+delta(i));%#ok<AGROW>
        elseif(knownVars(1,i)==1 && knownVars(2,i)==0)
            G(i)=linkPos(1,i)+x(dCount+3)*cos(knownVals(1,i))-x(6)-a3*...
                cos(x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(dCount+3)*sin(knownVals(1,i))-x(7)-a3*...
                sin(x(8)+delta(i));%#ok<AGROW>
            dCount=dCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==1)
            G(i)=linkPos(1,i)+knownVals(2,i)*cos(x(tCount))-x(6)-a3*cos(...
                x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+knownVals(2,i)*sin(x(tCount))-x(7)-a3*...
                sin(x(8)+delta(i));%#ok<AGROW>
            tCount=tCount+1;
        elseif(knownVars(1,i)==0 && knownVars(2,i)==0)
            G(i)=linkPos(1,i)+x(dCount+3)*cos(x(tCount))-x(6)-a3*cos(...
                x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(dCount+3)*sin(x(tCount))-x(7)-a3*sin(...
                x(8)+delta(i));%#ok<AGROW>
            tCount=tCount+1;
            dCount=dCount+1;
        end
    end
elseif (scenario == 0)
    for i=1:4
        if(knownVars(2,i)==1)
            G(i)=linkPos(1,i)+knownVals(2,i)*cos(x(i))-x(6)-a3*cos(x(8)+...
                delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+knownVals(2,i)*sin(x(i))-x(7)-a3*cos(...
                x(8)+delta(i));%#ok<AGROW>
        elseif(knownVars(2,i)==0)
            G(i)=linkPos(1,i)+x(5)*cos(x(i))-x(6)-a3*cos(x(8)+delta(i));%#ok<AGROW>
            G(i+4)=linkPos(2,i)+x(5)*sin(x(i))-x(7)-a3*sin(x(8)+delta(i));%#ok<AGROW>
        end
    end
end


end