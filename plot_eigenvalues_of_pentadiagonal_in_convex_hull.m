function plot_eigenvalues_of_pentadiagonal_in_convex_hull()
    % Step 1: Generate and plot convex hull structures for n = 1, 2, ..., N
    N = input('Enter the value of N for the convex hull structures: ');
    
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
    
    % Step 2: Generate random pentadiagonal doubly stochastic matrices, compute eigenvalues, and plot them
    num_matrices = input('Enter the number of random pentadiagonal doubly stochastic matrices to generate: ');
    m = input('Enter the size of the matrices (m): ');
    
    % Generate and print random pentadiagonal doubly stochastic matrices
    for i = 1:num_matrices
        % Generate a random pentadiagonal matrix
        A = random_pentadiagonal_matrix(m);
        
        % Make the matrix doubly stochastic
        A = make_doubly_stochastic(A);
        
        % Print the matrix
        fprintf('Matrix %d:\n', i);
        disp(A);
        
        % Compute the eigenvalues
        eigenvalues = eig(A);
        
        % Plot the eigenvalues
        plot(real(eigenvalues), imag(eigenvalues), 'go', 'MarkerFaceColor', 'g');
    end
    
    % Set plot properties
    axis equal;
    grid on;
    title('Eigenvalues of Pentadiagonal Doubly Stochastic Matrices in Union of Convex Hull Structures');
    xlabel('Real');
    ylabel('Imaginary');
    
    hold off;
end

function A = random_pentadiagonal_matrix(m)
    % Generate a random pentadiagonal matrix of size m x m
    A = zeros(m);
    
    % Fill the main diagonal
    A(1:m+1:end) = rand(1, m); % Main diagonal
    
    % Fill the first subdiagonal and superdiagonal
    if m > 1
        A(2:m+1:end) = rand(1, m-1); % First subdiagonal
        A(m+1:m+1:end) = rand(1, m-1); % First superdiagonal
    end
    
    % Fill the second subdiagonal and superdiagonal
    if m > 2
        % Second subdiagonal
        idx = sub2ind([m, m], 3:m, 1:m-2); % Correct linear indices for the second subdiagonal
        A(idx) = rand(1, m-2);
        
        % Second superdiagonal
        idx = sub2ind([m, m], 1:m-2, 3:m); % Correct linear indices for the second superdiagonal
        A(idx) = rand(1, m-2);
    end
end

function A = make_doubly_stochastic(A)
    % Make the matrix doubly stochastic using the Sinkhorn-Knopp algorithm
    max_iter = 1000; % Maximum number of iterations
    tolerance = 1e-6; % Tolerance for convergence
    
    for iter = 1:max_iter
        % Normalize rows
        A = A ./ sum(A, 2);
        
        % Normalize columns
        A = A ./ sum(A, 1);
        
        % Check for convergence
        row_sums = sum(A, 2);
        col_sums = sum(A, 1);
        if all(abs(row_sums - 1) < tolerance) && all(abs(col_sums - 1) < tolerance)
            break;
        end
    end
end