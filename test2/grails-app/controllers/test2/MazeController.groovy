package test2



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import groovy.json.JsonBuilder;

@Transactional(readOnly = true)
class MazeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Maze.list(params), model:[mazeInstanceCount: Maze.count()]
    }

    def show(Maze mazeInstance) {
        respond mazeInstance
    }

    def create() {
        respond new Maze(params)
    }

    @Transactional
    def save(Maze mazeInstance) {
        if (mazeInstance == null) {
            notFound()
            return
        }

        if (mazeInstance.hasErrors()) {
            respond mazeInstance.errors, view:'create'
            return
        }

        mazeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'maze.label', default: 'Maze'), mazeInstance.id])
                redirect mazeInstance
            }
            '*' { respond mazeInstance, [status: CREATED] }
        }
    }

    def edit(Maze mazeInstance) {
        respond mazeInstance
    }

    @Transactional
    def update(Maze mazeInstance) {
        if (mazeInstance == null) {
            notFound()
            return
        }

        if (mazeInstance.hasErrors()) {
            respond mazeInstance.errors, view:'edit'
            return
        }

        mazeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Maze.label', default: 'Maze'), mazeInstance.id])
                redirect mazeInstance
            }
            '*'{ respond mazeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Maze mazeInstance) {

        if (mazeInstance == null) {
            notFound()
            return
        }

        mazeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Maze.label', default: 'Maze'), mazeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'maze.label', default: 'Maze'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	def getPosition()
	{
		if (params.x<=100 && params.y<=100)
		{
			def result= ["stauts": "ok", "indice":200 ]
			return result as JSON
		}
		else{
			def result= ["stauts": "not found", "indice":404 ]
			return result as JSON
		}
	}
}
