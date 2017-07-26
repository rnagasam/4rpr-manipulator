function isentropicManipulability(linkPos,platSize,detail)
%Function to plot the condition number manipulability of the manipulator

% Geometry
x = linspace(-max(linkPos(1,:)),max(linkPos(1,:)),detail);
y = linspace(-max(linkPos(2,:)),max(linkPos(2,:)),detail);

for i=1:numel(x)
	for j=1:numel(y)
		eePos = [x(i),y(j),0];
		jointVars = iKinSolve(linkPos,platSize,eePos);
        Jacobi = giveJacobian(linkPos,platSize,eePos,jointVars);
        M(j,i) = sqrt(rcond(Jacobi*Jacobi'));%#ok<AGROW>
	end
end

figure
surf(x,y,M)
title('Isentropic Manipulability - 4RPR');
zlabel('Condition Number');
ylabel('y position');
xlabel('x position');

end
