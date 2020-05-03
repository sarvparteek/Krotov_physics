v1     =  5;
v2     = -3;
a1     = -2;
a2     =  4;
dt     = 0.01;
t      = 0:dt:2.2;
v1_vec = v1 * ones(1,numel(t)) + a1 * t;
v2_vec = v2 * ones(1,numel(t)) + a2 * t;
a1_vec = a1 * ones(1,numel(t));
a2_vec = a2 * ones(1,numel(t));
l_max  = 0.5 * ( abs(v1) + abs(v2) )^2 / ( abs(a1)+ abs(a2) );
dl     = 0.1 * l_max;
l      = (l_max - 2 * dl): dl: (l_max + 2 * dl);

figure(1)
subplot(3,1,1)
plot(t, a1_vec, '-r'); hold on;
plot(t, a2_vec, '--r');
xlabel('Time [s]')
ylabel('Accel [m/s^2]')
legend('1','2')
grid on;

subplot(3,1,2)
plot(t, v1_vec, '-r'); hold on;
plot(t, v2_vec, '--r');
xlabel('Time [s]');
ylabel('Vel [m/s]')
legend('1','2')
grid on;

subplot(3,1,3)
plot(NaN, NaN, '-r'); hold on;
plot(NaN, NaN, '--r'); hold on;
for i = 1:numel(l)
    x1 = v1 * t + 0.5 * a1 * t.^2;
    x2 = v2 * t + 0.5 * a2 * t.^2 + l(i);
    plot(t, x1, 'LineStyle', '-'); hold on;
    plot(t, x2, 'LineStyle', '--'); hold on;
end
legend('1','2')
xlabel('Time [s]')
ylabel('Pos [m]')
grid on;