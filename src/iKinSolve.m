function jointVars = iKinSolve(linkPos,platSize,eePos)
%Function to solve Inverse Kinematics of the 4RPR Manipulator

% Geometry
[a3,delta] = callGeometry(platSize);

% Solutions
revolutes=zeros(1,4); prismatics=zeros(1,4);
for i=1:4
    revolutes(i)=atan2(eePos(2)+a3*sin(eePos(3)+delta(i))-linkPos(2,i),...
        eePos(1)+a3*cos(eePos(3)+delta(i))-linkPos(1,i));
    prismatics(i)=sqrt((eePos(1)+a3*cos(eePos(3)+delta(i))-linkPos(1,i))^2+...
        (eePos(2)+a3*sin(eePos(3)+delta(i))-linkPos(2,i))^2);
end

jointVars = [revolutes; prismatics];

end
