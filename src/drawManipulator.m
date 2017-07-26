function drawManipulator(linkPos,platSize,eePos)
%Function to draw a 4RPR planar manipulator

% Geometry
[a3,delta] = callGeometry(platSize);

% Start the figure. Set axis equal
axis equal
hold on

% Draw platform
xplat=zeros(1,4); yplat=zeros(1,4);
for i=1:4
    xplat(i)=eePos(1)+a3*cos(eePos(3)+delta(i));
    yplat(i)=eePos(2)+a3*sin(eePos(3)+delta(i));
end
xplat=[xplat,xplat(1)]; yplat=[yplat,yplat(1)];
patch(xplat,yplat,'c','LineWidth',2);

% Draw lines on platform
for i=1:4
    plot([xplat(i),eePos(1)],[yplat(i),eePos(2)],'k--','LineWidth',0.5);
end

% Draw links
for i=1:4
    plot([linkPos(1,i),xplat(i)],[linkPos(2,i),yplat(i)],'g','LineWidth',5);
end

% Draw first joint - revolute 
for i=1:4
    plot(linkPos(1,i),linkPos(2,i),'o','MarkerSize',7,...
        'MarkerEdgeColor','k','MarkerFaceColor','r');
end

% Draw second joint - prismatic
for i=1:4
    plot([0.25*(linkPos(1,i)-xplat(i))+xplat(i),0.75*(linkPos(1,i)-...
        xplat(i))+xplat(i)],[0.25*(linkPos(2,i)-yplat(i))+...
        yplat(i),0.75*(linkPos(2,i)-yplat(i))+yplat(i)],...
        'LineWidth',5,'Color','r');
end


% Draw third joint - revolute
for i=1:4
    plot(xplat(i),yplat(i),'o','MarkerSize',7,'MarkerEdgeColor','k',...
        'MarkerFaceColor','r');
end


end
