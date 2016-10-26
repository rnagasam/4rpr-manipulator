function dy = doControl(time,y,shape,control,simTime,knownJoints,...
    gain,linkPos,platSize,initGuess)

[a3,delta] = callGeometry(platSize);

switch(shape)
	case 1
		center = [0 0]; radius = 1;
		Xd = [center(1)+radius*cos(time); center(2)+radius*sin(time); ...
			zeros(1,numel(time))]; 
		Xdot = [-radius*sin(time); radius*cos(time); zeros(1,numel(time))];
		plot(center(1)+radius*cos(0:0.01:simTime),center(2)+radius*sin(...
			0:0.01:simTime),'b');
	case 2
		center = [0 0]; radius = [1 0.5];
        Xd = [center(1)+radius(1)*cos(time); center(2)+radius(2)*sin(...
            time); zeros(1,numel(time))];
        Xdot = [-radius(1)*sin(time); radius(2)*cos(time); zeros(1,...
            numel(time))];
        plot(center(1)+radius(1)*cos(0:0.01:simTime),center(2)+radius(2)...
            *sin(0:0.01:simTime),'b');
end

switch(control)
	case 1
		iterLimit = 10; %initGuess = zeros(8,1);
		[eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
			initGuess,iterLimit);
		[J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars);
        Jinv = B\A;
%         J(:,knownJoints(1,:)) = 0;
%         Jinv(knownJoints(1,:),:) = 0;
        Jinv(:,3) = 0;
		dy = Jinv*Xdot;
	case 2
		% Closed Loop Joint Space
        iterLimit = 10; %initGuess = zeros(8,1);
        jointDesired = iKinSolve(linkPos,platSize,Xd);
        [eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
            initGuess,iterLimit);
        [J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars);
        J(:,knownJoints(1,:)) = 0;
        jD = jointDesired'; jD = jD(:);
        Jinv = B\A;
        Jinv(:,3)=0;
        dy = Jinv*Xdot + gain*(jD - y(1:8));
	case 3
		% Closed Loop Task Space
        iterLimit = 20; %initGuess = zeros(8,1);
%         [eePos,jointVars] = fKinSolve(linkPos,platSize,knownJoints,...
%             initGuess,iterLimit);
        % y -> t11 t12 t13 t14 d21 d22 d23 d24 '
        x1 = [linkPos(1,1)+y(5)*cos(y(1))]
        x2 =  [linkPos(1,2)+y(6)*cos(y(2))]
        x3 =  [linkPos(1,3)+y(7)*cos(y(3))]
        x4 =  [linkPos(1,4)+y(8)*cos(y(4))]
        y1 = [linkPos(2,1)+y(5)*sin(y(1))]
        y2 =  [linkPos(2,2)+y(6)*sin(y(2))]
        y3 =  [linkPos(2,3)+y(7)*sin(y(3))]
        y4 =  [linkPos(2,4)+y(8)*sin(y(4))]
        eePos(1) = (x1+x2+x3+x4)/4;
        eePos(2) = (y1+y2+y3+y4)/4;
        eePos(3) = atan2(y1-y2,x1-x2);
        jointVars = [y(1:4)'; y(5:8)']; 
        [J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars);
        Jinv = B\A;
        Jinv(:,3) = 0;
%         eePos(:,3) = 0;
%         J(:,knownJoints(1,:)) = 0;
        dy = Jinv*(Xdot + gain*(Xd - eePos'));
end





end
