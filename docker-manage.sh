case "$1" in
    "build")
        echo "Building Docker image..."
        docker-compose build
        ;;
    "up")
        echo "Starting services with PostgreSQL..."
        docker-compose up
        ;;
    "up-dev")
        echo "Starting development services (SQLite)..."
        docker-compose -f docker-compose.dev.yml up
        ;;
    "down")
        echo "Stopping all services..."
        docker-compose down
        ;;
    "migrate")
        echo "Running database migrations..."
        docker-compose exec web python manage.py migrate
        ;;
    "makemigrations")
        echo "Creating database migrations..."
        docker-compose exec web python manage.py makemigrations
        ;;
    "shell")
        echo "Opening Django shell..."
        docker-compose exec web python manage.py shell
        ;;
    "bash")
        echo "Opening container bash..."
        docker-compose exec web bash
        ;;
    "logs")
        echo "Showing logs..."
        docker-compose logs -f web
        ;;
    "test")
        echo "Running tests..."
        docker-compose exec web python manage.py test
        ;;
    "collectstatic")
        echo "Collecting static files..."
        docker-compose exec web python manage.py collectstatic --noinput
        ;;
    "reset")
        echo "Resetting database..."
        docker-compose down -v
        docker-compose up -d db
        sleep 5
        docker-compose exec web python manage.py migrate
        ;;
    *)
        echo "Usage: $0 {build|up|up-dev|down|migrate|makemigrations|shell|bash|logs|test|collectstatic|reset}"
        echo ""
        echo "Commands:"
        echo "  build           - Build the Docker image"
        echo "  up              - Start services with PostgreSQL"
        echo "  up-dev          - Start development services with SQLite"
        echo "  down            - Stop all services"
        echo "  migrate         - Run database migrations"
        echo "  makemigrations  - Create new migrations"
        echo "  shell           - Open Django shell"
        echo "  bash            - Open container bash shell"
        echo "  logs            - Show web service logs"
        echo "  test            - Run tests"
        echo "  collectstatic   - Collect static files"
        echo "  reset           - Reset database (WARNING: deletes all data)"
        exit 1
        ;;
esac
