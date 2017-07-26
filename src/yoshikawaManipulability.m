function yoshikawaManipulability(linkPos,platSize,detail)
%Function to plot the Yoshikawa Manipulability of the manipulator

% Geometry
x = linspace(-max(linkPos(1,:)),max(linkPos(1,:)),detail);
y = linspace(-max(linkPos(2,:)),max(linkPos(2,:)),detail);

for i=1:numel(x)
	for j=1:numel(x)
		eePos = [x(i),y(j),0];
		jointVars = iKinSolve(linkPos,platSize,eePos);
		Jacobi = giveJacobian(linkPos,platSize,eePos,jointVars);
		M(j,i) = sqrt(det(Jacobi*Jacobi'));%#ok<AGROW>
	end
end

figure
surf(x,y,M)
title('Yoshikawa Manipulability - 4RPR');
zlabel('Manipulability Index');
ylabel('y position');
xlabel('x position');

end
