function generate_doubly_stochastic_matrices()
    % Prompt the user to input the value of n
    n = input('Enter the number of doubly stochastic matrices to generate :');
    
    % Prompt the user to input the size of the matrices (m x m)
    m = input('Enter the size of the matrices (m): ');
    
    % Generate n doubly stochastic matrices
    for k = 1:n
        % Generate a random doubly stochastic matrix
        A = rand(m); % Random m x m matrix with entries in [0, 1]
        
        % Normalize rows to sum to 1
        A = A ./ sum(A, 2);
        
        % Use the Sinkhorn-Knopp algorithm to make the matrix doubly stochastic
        A = sinkhorn_knopp(A);
        
        % Display the matrix
        fprintf('Doubly Stochastic Matrix %d:\n', k);
        disp(A);
    end
end

function A = sinkhorn_knopp(A)
    % Sinkhorn-Knopp algorithm to make a matrix doubly stochastic
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