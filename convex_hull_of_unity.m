function convex_hull_of_unity()
    % input n
    n = input('Enter the number of roots of unity (n) :');
    
    % Step 1: Generate the n-th roots of unity
    angles = linspace(0, 2*pi, n+1); % n+1 points to include 0 and 2*pi
    angles(end) = []; % Remove the last point to avoid duplication
    roots = exp(1i * angles);      % Roots of unity (complex numbers)
    
    % Step 2: Convert roots to (x, y) coordinates
    x = real(roots); % Real part = x-coordinate
    y = imag(roots); % Imaginary part = y-coordinate
    
    % Step 3: Compute the convex hull
    hull_indices = convhull(x, y); % Indices of points forming the convex hull
    
    % Step 4: Plot the unit circle
    figure;
    t = linspace(0, 2*pi, 100); % 100 points for a smooth circle
    plot(cos(t), sin(t), 'k--', 'LineWidth', 1.5); % Plot unit circle
    hold on;
    
    % Step 5: Plot the roots of unity
    plot(x, y, 'bo', 'MarkerFaceColor', 'b'); % Plot roots as blue circles
    
    % Step 6: Plot the convex hull
    plot(x(hull_indices), y(hull_indices), 'r-', 'LineWidth', 2); % Red convex hull
    
    % Step 7: Add labels, title, and legend
    axis equal; % Ensure the circle is not stretched
    grid on;    % Add a grid
    title(['Convex Hull of ', num2str(n), '-th Roots of Unity']);
    xlabel('Real Axis');
    ylabel('Imaginary Axis');
    legend('Unit Circle', 'Roots of Unity', 'Convex Hull');
    hold off;
end