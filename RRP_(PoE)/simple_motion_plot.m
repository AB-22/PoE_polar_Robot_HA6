function simple_motion_plot( Q , L)
end_effector=zeros(length(Q(:,1)),3);

for i=1:length(Q(:,1))
    q=Q(i,:);

    [graphx, graphy, graphz, graphx_scatter ,graphy_scatter,graphz_scatter ]= plot_trajFK( q , L);
    end_effector(i,:)=[graphx(5),graphy(5),graphz(5)];
    pause(0.3)
    clf
    plot3(graphx(1:4), graphy(1:4), graphz(1:4), 'b', 'LineWidth',3)
    xlim([-3 3])
    ylim([-3 3])
    zlim([0 3])
    xlabel('x')
    ylabel('y')
    zlabel('z')
    grid on
    hold on
    plot3(graphx(4:5), graphy(4:5), graphz(4:5), 'k', 'LineWidth',1)
    hold on
    scatter3(graphx_scatter ,graphy_scatter,graphz_scatter, 'r' , 'filled','LineWidth',1.2)
    hold on
    pause(0.3)
    plot3(end_effector(i,1),end_effector(i,2) , end_effector(i,3), 'o-', 'LineWidth',2,'Color','green' )
    hold on
  
end

for i=1:length(Q(:,1))
    plot3(end_effector(i,1),end_effector(i,2) , end_effector(i,3), 'x', 'LineWidth',2 ,'Color','cyan')
    hold on
end

end