function [eePos, jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
    initGuess,iterLimit)
% Function to numerically solve the governing equations for the forward
% kinematics problem

x_init = initGuess; nIter = 0; incrmnt = 1;
options=optimset('MaxFunEvals',1000,'Display','Off');

[P,~,exitflag] = fsolve(@(x) governingEquations(x,linkPos,platSize,...
    knownJoints),x_init,options);

while(exitflag<1 && nIter<iterLimit)    
    [P,~,exitflag] = fsolve(@(x) governingEquations(x,linkPos,...
        platSize,knownJoints),x_init,options);
    x_init(6:7) = x_init(6:7) + incrmnt*0.1;
    x_init(8) = x_init(8) + incrmnt*nIter*0.01;
    x_init(1:5) = x_init(1:5) + incrmnt*nIter*0.01;
    nIter = nIter+1;
end

eePos = P(6:8);
jointVars = jointVarsArrange(knownJoints,P(1:5));

end