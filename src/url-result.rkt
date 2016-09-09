#lang racket

(provide url-result url-result-path url-result-content)

(struct url-result (path content))