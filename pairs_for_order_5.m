function generate_pentadiagonal_dsm_convex_hull_order5()
    % Step 1: Generate and plot convex hull structures for n = 1,2,3,4,5 (in red)
    figure;
    hold on;

    % Plot unit circle
    t = linspace(0, 2*pi, 100);
    plot(cos(t), sin(t), 'k--', 'LineWidth', 1.5);
    
    for n = 1:5
        theta = linspace(0, 2*pi, n+1);
        theta(end) = [];
        roots_unity = exp(1i * theta);

        x = real(roots_unity);
        y = imag(roots_unity);
        
        if n == 1
            plot(x, y, 'ro', 'MarkerFaceColor', 'r');
        elseif n == 2
            plot(x, y, 'ro', 'MarkerFaceColor', 'r');
            plot(x, y, 'r-', 'LineWidth', 1.5);
        else
            k = convhull(x, y);
            plot(x, y, 'ro', 'MarkerFaceColor', 'r');
            plot(x(k), y(k), 'r-', 'LineWidth', 1.5);
        end
    end

    % Step 2: Generate and print valid pentadiagonal permutation matrices
    perms_list = generate_pentadiagonal_permutations(5);

    fprintf('\n=== Valid Pentadiagonal Permutation Matrices for Order 5 ===\n');
    num_valid = length(perms_list);
    fprintf('Total valid matrices found: %d\n', num_valid);
    
    for i = 1:num_valid
        fprintf('\nMatrix P%d:\n', i);
        disp(perms_list{i});
    end

    % Step 3: Generate valid ordered pairs (P1, P2) for convex combinations
    pairs = nchoosek(1:num_valid, 2); % Get unordered pairs
    pairs = [pairs; flip(pairs, 2)]; % Convert to ordered pairs

    num_combinations = 10;
    alpha_values = linspace(0, 1, num_combinations);

    eigenvalues_all = [];

    % Compute eigenvalues without printing matrices
    for pair_idx = 1:size(pairs, 1)
        P1 = perms_list{pairs(pair_idx, 1)};
        P2 = perms_list{pairs(pair_idx, 2)};
        
        for alpha_idx = 1:num_combinations
            alpha = alpha_values(alpha_idx);
            A = alpha * P1 + (1 - alpha) * P2;
            eigenvalues = eig(A);
            eigenvalues_all = [eigenvalues_all; eigenvalues]; %#ok<AGROW>
        end
    end

    % Step 4: Plot eigenvalues (in blue)
    plot(real(eigenvalues_all), imag(eigenvalues_all), 'bo', 'MarkerFaceColor', 'b'); 

    % Step 5: Final plot adjustments
    axis equal;
    grid on;
    title('Convex Hull Structures (Red) and Eigenvalues (Blue) for Order 5 Pentadiagonal DSM');
    xlabel('Real Part');
    ylabel('Imaginary Part');
    hold off;
end

function perms_list = generate_pentadiagonal_permutations(n)
    P_all = perms(1:n);
    perms_list = {};
    
    for i = 1:size(P_all, 1)
        P = zeros(n);
        for j = 1:n
            P(j, P_all(i, j)) = 1;
        end
        
        is_valid = true;
        for row = 1:n
            col = P_all(i, row);
            if abs(row - col) > 2  
                is_valid = false;
                break;
            end
        end
        
        % Exclude matrices with 1s at (1,4), (1,5), (4,1), (5,1), (5,2), (2,5)
        if is_valid && P(1,4) == 0 && P(1,5) == 0 && P(4,1) == 0 && ...
                      P(5,1) == 0 && P(5,2) == 0 && P(2,5) == 0
            perms_list{end+1} = P; %#ok<AGROW>
        end
    end
end
