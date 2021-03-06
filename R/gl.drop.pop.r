#' Remove specified populations from a genelight \{adegenet\} object
#'
#' Individuals are assigned to populations based on the specimen metadata data file (csv) used with gl.read.dart(). 
#'
#' The script, having deleted populations, optionally identifies resultant monomorphic loci or loci
#' with all values missing and deletes them (using gl.filter.monomorphs.r). The script also optionally
#' recalculates statistics made redundant by the deletion of individuals from the dataset.
#' 
#' The script returns a genlight object with the new population assignments and the recalculated locus metadata.
#'
#' @param x -- name of the genlight object containing SNP genotypes or a genind object containing presence/absence data [required]
#' @param pop.list -- a list of populations to be removed [required]
#' @param recalc -- Recalculate the locus metadata statistics [default FALSE]
#' @param mono.rm -- Remove monomorphic loci [default TRUE]
#' @param v -- verbosity: 0, silent or fatal errors; 1, begin and end; 2, progress log ; 3, progress and results summary; 5, full report [default 2]
#' @return A genlight object with the reduced data
#' @export
#' @author Arthur Georges (bugs? Post to \url{https://groups.google.com/d/forum/dartr})
#' @examples
#'    gl <- gl.drop.pop(testset.gl, pop.list=c("EmsubRopeMata","EmvicVictJasp"))
#' @seealso \code{\link{gl.filter.monomorphs}}
#' @seealso \code{\link{gl.recalc.metrics}}
#' 

gl.drop.pop <- function(x, pop.list, recalc=FALSE, mono.rm=TRUE, v=2){

# ERROR CHECKING
  
  if(class(x)!="genlight") {
    cat("Fatal Error: genlight object required!\n"); stop("Execution terminated\n")
  }
  for (case in pop.list){
    if (!(case%in%popNames(x))){
      cat("Warning: Listed population",case,"not present in the dataset -- ignored\n")
      pop.list <- pop.list[!(pop.list==case)]
    }
  }
  if (length(pop.list) == 0) {
    cat("Fatal Error: no populations listed to drop!\n"); stop("Execution terminated\n")
  }
  if (v < 0 | v > 5){
    cat("    Warning: verbosity must be an integer between 0 [silent] and 5 [full report], set to 2\n")
    v <- 2
  }
  
#FLAG SCRIPT START
  
  if (v >= 1) {
    cat("Starting gl.drop.pop: Deleting selected populations\n")
  }

# REMOVE POPULATIONS
  
  if (v >= 2) {
    cat("  Deleting populations", pop.list, "\n")
  }

# Delete listed populations, recalculate relevant locus metadata and remove monomorphic loci
  
  # Remove rows flagged for deletion
    x <- x[!x$pop%in%pop.list]
  # Remove monomorphic loci
    if (mono.rm) {x <- gl.filter.monomorphs(x,v=v)}
  # Recalculate statistics
    if (recalc) {gl.recalc.metrics(x,v=v)}

# REPORT A SUMMARY
    
  if (v >= 3) {
    cat("Summary of recoded dataset\n")
    cat(paste("  No. of loci:",nLoc(x),"\n"))
    cat(paste("  No. of individuals:", nInd(x),"\n"))
    cat(paste("  No. of populations: ", length(levels(factor(pop(x)))),"\n"))
  }
  if (v >= 2) {  
    if (!recalc) {
      cat("Note: Locus metrics not recalculated\n")
    } else {
      cat("Note: Locus metrics recalculated\n")
    }
    if (!mono.rm) {
      cat("Note: Resultant monomorphic loci not deleted\n")
    } else{
      cat("Note: Resultant monomorphic loci deleted\n")
    }
  }

# FLAG SCRIPT END
    
  if (v > 0) {
    cat("Completed gl.drop.pop\n\n")
  }
    
  return <- x
  
}

