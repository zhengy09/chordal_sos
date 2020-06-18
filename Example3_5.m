
%% Example 3-5
% feasible region
% t = linspace(0,2*pi,30);
% bnd = zeros(2,length(t));
% for i = 1:length(t)
%     obj = a*cos(t) + b*sin(t); 
%     solvesos(F,obj,opts)
%     %optimize(sos(p),obj);
%     bnd(1,i) = value(a);
%     bnd(2,i) = value(b);
% end



% clc;clear;
% sdpvar x y z        % sos variables
% v = sdpvar(3,1);    % scalarization  
% sdpvar a b          % parameters
% 
% P = [x^4+y^4,    -a*x^2*y^2,   0; 
%      -a*x^2*y^2, a*y^4+b*z^4, -b*y^2*z^2; 
%      0,          -b*y^2*z^2,    x^4+z^4];
% opts =  sdpsettings('solver','sedumi');
% 
% 
% opts.sos.csp = 0;
% bnd_ctr  = cell(3,1);
% for k = 1:4
%     F = sos((x^2+y^2+z^2)^(k-1)*v'*P*v);               % The current Yalmip only exploit csp in the scalar case
%     tmp = plot(F,[a,b],'m',100,opts);     %% boundary points
%     bnd_ctr{k} = tmp{1};
% end
% 
% opts.sos.csp = 1;
% bnd_dec  = cell(3,1);
% for k = 1:4
%     F = sos((x^2+y^2+z^2)^(k-1)*v'*P*v);               % The current Yalmip only exploit csp in the scalar case
%     tmp = plot(F,[a,b],'m',100,opts);     %% boundary points
%     bnd_dec{k} = tmp{1};
% end
% 

load Example3_5

%% plot feasible region
set(0,'defaulttextinterpreter','latex')
set(0,'DefaultAxesColor','none')

figure;  % no chordal decomposition
ColorBar = ['b','m','k','g'];
h = cell(2,1);
for k = 1:2
    patch(bnd_ctr{k}(1,:),bnd_ctr{k}(2,:),ColorBar(k),'FaceAlpha',0.08); hold on
    h{k} = plot(bnd_ctr{k}(1,:),bnd_ctr{k}(2,:),ColorBar(k),'linewidth',1.5);
end
h = legend([h{1},h{2}],'$$\nu = 0$$','$$\nu = 1$$','Location','Northwest');
set(h,'FontSize',12,'Interpreter','latex','box','off')


% Change axis
Xlim = [0,1.2];
Ylim = [0,1.2];
xlim(Xlim);ylim(Ylim);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% font style
set(gca,'TickLabelInterpreter','latex','fontsize',12)
%set(gca,'XTickLabel',{'0','0.2','0.4','0.6','0.8','1.0','1.2'},'XTick',[0 0.2 0.4 0.6 0.8 1 1.2]);
set(gca,'YTickLabel',{'0','0.5','1'},'YTick',[0 0.5 1]);
set(gca, 'Layer', 'top');

% lables
text(1.2,0.06,'$$\lambda_1$$','FontSize',14)
text(0.06,1.2,'$$\lambda_2$$','FontSize',14)
set(gcf,'Position',[100 100 300 300])
print(gcf,'Example3_5a','-painters','-dpng','-r600')

%% with chordal decomposition
figure;  % no chordal decomposition
ColorBar = ['b','m','g','k'];
h = cell(3,1);
for k = 1:3
    patch(bnd_dec{k}(1,:),bnd_dec{k}(2,:),ColorBar(k),'FaceAlpha',0.08); hold on
    h{k} = plot(bnd_dec{k}(1,:),bnd_dec{k}(2,:),ColorBar(k),'linewidth',1.5);
end
h = legend([h{1},h{2},h{3}],'$$\nu = 0$$','$$\nu = 1$$','$$\nu = 2$$','Location','Northwest');
set(h,'FontSize',12,'Interpreter','latex','box','off')


% Change axis
Xlim = [0,1.2];
Ylim = [0,1.2];
xlim(Xlim);ylim(Ylim);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% font style
set(gca,'TickLabelInterpreter','latex','fontsize',12)
%set(gca,'XTickLabel',{'0','0.2','0.4','0.6','0.8','1.0','1.2'},'XTick',[0 0.2 0.4 0.6 0.8 1 1.2]);
set(gca,'YTickLabel',{'0','0.5','1'},'YTick',[0 0.5 1]);
set(gca, 'Layer', 'top');

% lables
text(1.2,0.06,'$$\lambda_1$$','FontSize',14)
text(0.06,1.2,'$$\lambda_2$$','FontSize',14)
set(gcf,'Position',[100 100 300 300])
print(gcf,'Example3_5b','-painters','-dpng','-r600')
