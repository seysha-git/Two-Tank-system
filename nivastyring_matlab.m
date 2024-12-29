h = 0.1; % Skrittlengde
Tsim = 100; % Simuleringstid i sekunder
K = 1; % Modellparametre
T = 2;
xd = 1;
Kp = 1;
Ki = 0.1;
x1(1) = 1; % Initialverdier
x2(1) = 0;

for i = 2:(Tsim/h + 1)
    x1(i) = x1(i-1) + h * x2(i-1);
    x2(i) = x2(i-1) + h * (-((K*Ki)/T)*x1(i-1) - ((1 + K*Kp)/T)*x2(i-1) + (1/T)*xd);
end

figure; % Åpner et nytt vindu for figuren
plot(x1, 'DisplayName', 'x1')
hold on
plot(x2, 'DisplayName', 'x2')
legend('show')
hold off

%%%%%%%%%%%%%
h_s = [0.1, 0.5, 0.7, 1.0, 1.5, 2, 2.2];
x1s = zeros(1, 101);
x2s = zeros(1, 101);
x1s(1) = 1;
x2s(1) = 0;

figure; % Åpner et nytt vindu for å plotte flere simuleringer
for h = h_s
    Tsim = h * 1000;
    num_steps = Tsim/h + 1;
    
    % Nullstiller verdier for hver simulering
    x1s = zeros(1, num_steps);
    x2s = zeros(1, num_steps);
    x1s(1) = 1;
    x2s(1) = 0;
    
    for i = 2:num_steps
        x1s(i) = x1s(i-1) + h * x2s(i-1);
        x2s(i) = x2s(i-1) + h * (-((K*Ki)/T)*x1s(i-1) - ((1 + K*Kp)/T)*x2s(i-1) + (1/T)*xd);
    end
    
    plot(x1s, 'DisplayName', sprintf('h=%.1f', h))
    ylim([-1, 10]);
    legend show
    hold on;
end
hold off












