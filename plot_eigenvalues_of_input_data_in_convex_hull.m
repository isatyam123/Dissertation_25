function plot_eigenvalues_of_input_data_in_convex_hull()
    % Step 1: Generate and plot convex hull structures for n = 1, 2, ..., N
    N = input('Enter the value of N for the convex hull structures :');
    
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
            plot(x, y, 'bo', 'MarkerFaceColor', 'b');
        elseif n == 2
            % For n = 2, the convex hull is the line segment connecting the two points
            plot(x, y, 'bo', 'MarkerFaceColor', 'b');
            plot(x, y, 'r-', 'LineWidth', 2);
        else
            % For n >= 3, compute the convex hull
            k = convhull(x, y);
            plot(x, y, 'bo', 'MarkerFaceColor', 'b');
            plot(x(k), y(k), 'r-', 'LineWidth', 2);
        end
    end
    
    % Step 2: Input a matrix and compute its eigenvalues
    m = input('Enter the size of the matrix (m): ');
    fprintf('Enter the matrix of size %d x %d:\n', m, m);
    A = zeros(m, m);
    
    % Input the matrix elements
    for i = 1:m
        for j = 1:m
            A(i, j) = input(sprintf('Enter element A(%d, %d): ', i, j));
        end
    end
    
    % Display the matrix
    fprintf('The entered matrix is:\n');
    disp(A);
    
    % Compute the eigenvalues
    eigenvalues = eig(A);
    
    % Plot the eigenvalues
    plot(real(eigenvalues), imag(eigenvalues), 'go', 'MarkerFaceColor', 'g');
    
    % Set plot properties
    axis equal;
    grid on;
    title('Eigenvalues of the Matrix in Convex Hull Structures');
    xlabel('Real');
    ylabel('Imaginary');
    hold off;
end