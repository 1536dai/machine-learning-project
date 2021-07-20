clear ; %ɾ����ǰ���б���
close all; %�������ͼ��
clc %��������


%% ����
fprintf('Plotting Data ...\n')
num = '1';
data = load(['data',num,'.txt']);
X = data(1:11, 1); % ��x
y = data(1:11, 2); % ��y
m = length(y); % ѵ��������
plotData(['data',num,'.txt'],X, y); %����x��y


fprintf('Program paused. Press keyboard to continue.\n');


% ���ۺ���  �ݶ��½�

X = [ones(m, 1), data(1:11,1)]; % x���1�У�������theta0
theta = zeros(2, 1); % ��ʼ����ϲ���

% �ݶ��½���������
iterations = 10000; % ��������
alpha = 0.01; % ѧϰ��

fprintf('\nRunning Gradient Descent ...\n')
theta = gradientDescent(X, y, theta, alpha, iterations);%�����ݶ��½���theta


fprintf('Theta found by gradient descent:\n');
fprintf('%f\n', theta);%��ӡtheta

% ���Ƴ��������
hold on; % ��֮ǰ�Ļ�ͼ���ڻ���
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')%Ϊͼ��ӱ�ǩ
hold off % ������֮ǰ�Ļ�ͼ���ڻ���

fprintf('Program paused. Press keyboard to continue.\n');


%% ��ͬ�����Ŀ��ӻ�
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% ����J���ݶ�
theta0_vals = linspace(16000, 18000, 100); %����һ�� 100 ��Ԫ�ص�����, ���ȷֲ��� 16000 �� 18000
theta1_vals = linspace(-267,-67 , 100);

% ��ʼ��J_vals
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% ����J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

% �����surf���Ҫ��J_valsת��
J_vals = J_vals';
% �������
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

prediction = [1,data(12,1)]*theta;
error = abs( prediction - data(12,2) );
fprintf('True price is %d\n',data(12,2));
fprintf('Prediction price is %d\n',prediction);
fprintf('House price error between truth and prediction is:%f%% \n',error/data(12,2)/100);