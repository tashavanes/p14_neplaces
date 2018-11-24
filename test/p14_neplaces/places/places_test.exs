defmodule P14Neplaces.PlacesTest do
  use P14Neplaces.DataCase

  alias P14Neplaces.Places

  describe "visits" do
    alias P14Neplaces.Places.Visit

    @valid_attrs %{date: ~D[2010-04-17], description: "some description", place: "some place", rating: 42, state: "some state", time: ~T[14:00:00]}
    @update_attrs %{date: ~D[2011-05-18], description: "some updated description", place: "some updated place", rating: 43, state: "some updated state", time: ~T[15:01:01]}
    @invalid_attrs %{date: nil, description: nil, place: nil, rating: nil, state: nil, time: nil}

    def visit_fixture(attrs \\ %{}) do
      {:ok, visit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Places.create_visit()

      visit
    end

    test "list_visits/0 returns all visits" do
      visit = visit_fixture()
      assert Places.list_visits() == [visit]
    end

    test "get_visit!/1 returns the visit with given id" do
      visit = visit_fixture()
      assert Places.get_visit!(visit.id) == visit
    end

    test "create_visit/1 with valid data creates a visit" do
      assert {:ok, %Visit{} = visit} = Places.create_visit(@valid_attrs)
      assert visit.date == ~D[2010-04-17]
      assert visit.description == "some description"
      assert visit.place == "some place"
      assert visit.rating == 42
      assert visit.state == "some state"
      assert visit.time == ~T[14:00:00]
    end

    test "create_visit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Places.create_visit(@invalid_attrs)
    end

    test "update_visit/2 with valid data updates the visit" do
      visit = visit_fixture()
      assert {:ok, %Visit{} = visit} = Places.update_visit(visit, @update_attrs)
      assert visit.date == ~D[2011-05-18]
      assert visit.description == "some updated description"
      assert visit.place == "some updated place"
      assert visit.rating == 43
      assert visit.state == "some updated state"
      assert visit.time == ~T[15:01:01]
    end

    test "update_visit/2 with invalid data returns error changeset" do
      visit = visit_fixture()
      assert {:error, %Ecto.Changeset{}} = Places.update_visit(visit, @invalid_attrs)
      assert visit == Places.get_visit!(visit.id)
    end

    test "delete_visit/1 deletes the visit" do
      visit = visit_fixture()
      assert {:ok, %Visit{}} = Places.delete_visit(visit)
      assert_raise Ecto.NoResultsError, fn -> Places.get_visit!(visit.id) end
    end

    test "change_visit/1 returns a visit changeset" do
      visit = visit_fixture()
      assert %Ecto.Changeset{} = Places.change_visit(visit)
    end
  end
end
