function convex_hull_of_union_of_unity()
    % Prompt the user to input the value of N at runtime
    N = input('Enter the value of N :');
    
    % Create a figure
    figure;
    hold on;
    
    % Plot the unit circle
    t = linspace(0, 2*pi, 100);
    plot(cos(t), sin(t), 'k--', 'LineWidth', 1.5);
    
    % Loop through n = 1 to N
    for n = 1:N
        % Generate the n-th roots of unity
        theta = linspace(0, 2*pi, n+1); % Angles for the roots of unity
        theta(end) = []; % Remove the last point to avoid duplication
        roots_unity = exp(1i * theta); % n-th roots of unity
        
        % Convert to Cartesian coordinates
        x = real(roots_unity);
        y = imag(roots_unity);
        
        % Handle cases where n = 1 or n = 2
        if n == 1
            % For n = 1, the convex hull is just the point itself
            plot(x, y, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'n = 1');
        elseif n == 2
            % For n = 2, the convex hull is the line segment connecting the two points
            plot(x, y, 'bo', 'MarkerFaceColor', 'b');
            plot(x, y, 'r-', 'LineWidth', 2, 'DisplayName', 'n = 2');
        else
            % For n >= 3, compute the convex hull
            k = convhull(x, y);
            plot(x, y, 'bo', 'MarkerFaceColor', 'b');
            plot(x(k), y(k), 'r-', 'LineWidth', 2, 'DisplayName', ['n = ', num2str(n)]);
        end
    end
    
    % Set plot properties
    axis equal;
    grid on;
    title(['Convex Hulls of Roots of Unity for n = 1 to ', num2str(N)]);
    xlabel('Real');
    ylabel('Imaginary');
    hold off;
end