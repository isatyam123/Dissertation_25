function generate_pentadiagonal_dsm_order5()
    % Step 1: Generate and plot convex hull structures for n = 1, 2, 3, 4, 5 (in red)
    figure;
    hold on;

    % Plot unit circle
    t = linspace(0, 2*pi, 100);
    plot(cos(t), sin(t), 'k--', 'LineWidth', 1.5);
    
    for n = 1:5
        % Generate n-th roots of unity
        theta = linspace(0, 2*pi, n+1);
        theta(end) = [];
        roots_unity = exp(1i * theta);
        
        % Cartesian coordinates
        x = real(roots_unity);
        y = imag(roots_unity);
        
        % Plot convex hull structures in red
        if n == 1
            plot(x, y, 'ro', 'MarkerFaceColor', 'r'); % Single point
        elseif n == 2
            plot(x, y, 'ro', 'MarkerFaceColor', 'r');
            plot(x, y, 'r-', 'LineWidth', 1.5); % Line segment
        else
            k = convhull(x, y);
            plot(x, y, 'ro', 'MarkerFaceColor', 'r');
            plot(x(k), y(k), 'r-', 'LineWidth', 1.5); % Convex hull
        end
    end

    % Step 2: Generate valid permutation matrices
    perms_list = generate_valid_permutation_matrices(5); % Filtered valid P-matrices
    triplets = nchoosek(1:length(perms_list), 3); % All valid (P1, P2, P3) triplets
    num_combinations = 10;
    alpha_values = linspace(0, 1, num_combinations);
    beta_values = linspace(0, 1, num_combinations);
    
    eigenvalues_all = [];

    for idx = 1:size(triplets, 1)
        P1 = perms_list{triplets(idx, 1)};
        P2 = perms_list{triplets(idx, 2)};
        P3 = perms_list{triplets(idx, 3)};
        
        for alpha = alpha_values
            for beta = beta_values
                if alpha + beta <= 1
                    % Generate convex combination
                    A = alpha * P1 + beta * P2 + (1 - alpha - beta) * P3;
                    
                    % Compute eigenvalues
                    eigenvalues = eig(A);
                    eigenvalues_all = [eigenvalues_all; eigenvalues]; %#ok<AGROW>
                end
            end
        end
    end

    % Plot eigenvalues (in blue)
    plot(real(eigenvalues_all), imag(eigenvalues_all), 'bo', 'MarkerFaceColor', 'b');

    % Step 3: Final plot adjustments
    axis equal;
    grid on;
    title('Convex Hull Structures (Red) and Eigenvalues (Blue) for Order 5 Pentadiagonal DSM');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    hold off;

    % Print all valid permutation matrices
    fprintf('\nValid Permutation Matrices for Order 5 Pentadiagonal DSM:\n');
    for i = 1:length(perms_list)
        fprintf('P%d:\n', i);
        disp(perms_list{i});
    end
end

function perms_list = generate_valid_permutation_matrices(n)
    % Generate all n! permutation matrices
    P_all = perms(1:n);
    perms_list = {};
    
    % Filter only pentadiagonal permutation matrices
    for i = 1:size(P_all, 1)
        P = zeros(n);
        for j = 1:n
            P(j, P_all(i, j)) = 1;
        end
        
        % Exclude matrices with 1 at (1,4), (1,5), (4,1), (5,1), (5,2), (2,5)
        if P(1,4) == 0 && P(1,5) == 0 && P(4,1) == 0 && P(5,1) == 0 && P(5,2) == 0 && P(2,5) == 0
            perms_list{end+1} = P; %#ok<AGROW>
        end
    end
end
