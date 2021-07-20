clear ; %删除当前所有变量
close all; %清楚所有图像
clc %命令清屏


%% 绘制
fprintf('Plotting Data ...\n')
num = '1';
data = load(['data',num,'.txt']);
X = data(1:11, 1); % 读x
y = data(1:11, 2); % 读y
m = length(y); % 训练样本数
plotData(['data',num,'.txt'],X, y); %绘制x、y


fprintf('Program paused. Press keyboard to continue.\n');


% 代价函数  梯度下降

X = [ones(m, 1), data(1:11,1)]; % x多加1列，考虑上theta0
theta = zeros(2, 1); % 初始化拟合参数

% 梯度下降参数设置
iterations = 10000; % 迭代次数
alpha = 0.01; % 学习率

fprintf('\nRunning Gradient Descent ...\n')
theta = gradientDescent(X, y, theta, alpha, iterations);%利用梯度下降求theta


fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);%打印theta

% 绘制出线性拟合
hold on; % 在之前的绘图窗口绘制
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')%为图表加标签
hold off % 不会在之前的绘图窗口绘制

fprintf('Program paused. Press keyboard to continue.\n');


%% 不同参数的可视化
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% 计算J的梯度
theta0_vals = linspace(16000, 18000, 100); %创建一个 100 个元素的向量, 均匀分布于 16000 和 18000
theta1_vals = linspace(-267,-67 , 100);

% 初始化J_vals
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% 计算J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% 需调用surf命令，要将J_vals转置
J_vals = J_vals';
% 球面绘制
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

prediction = [1,data(12,1)]*theta;
error = abs( prediction - data(12,2) );
fprintf('True price is %d\n',data(12,2));
fprintf('Prediction price is %d\n',prediction);
fprintf('House price error between truth and prediction is:%f%% \n',error/data(12,2)/100);