require 'spec_helper'

describe ProjectsController do
  describe 'GET index' do
    it 'assigns @projects'
    it 'renders the index template'
  end

  describe "GET show" do
    it 'assigns the requested project as @project'
  end

  describe "GET new" do
    it 'assigns a new project as @project'
  end

  describe "GET edit" do
    it 'assigns the requested widget as @widget'
  end

  describe "POST create" do
    context "with valid params" do
      it 'creates a new Project'
      it 'assigns a newly created project as @project'
      it 'redirects to the created project'
    end

    context "with invalid params" do
      it 'assigns a newly created but unsaved project as @project'
      it "re-renders the 'new' template"
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'updates the requested project'
      it 'assigns the requested project as @project'
      it 'redirects to the project'
    end

    context "with invalid params" do
      it 'assigns the requested project as @project'
      it "re-renders the 'edit' template"
    end
  end

  describe "DELETE destroy" do
    it 'destroys the requested project'
    it 'redirects to the projects list'
  end

end
